// Seed: 3703380663
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial
    if (id_1)
      #1 begin
        if (id_3) id_5 <= 1;
        else assert (~id_4) $display(id_1, id_3);
      end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_5;
  module_0(
      id_4, id_4, id_3, id_4, id_1, id_4
  );
  initial begin
    #1;
    id_1 <= 1;
    id_5 <= 1;
    if (1) begin
      id_5 = id_1;
    end
  end
endmodule
