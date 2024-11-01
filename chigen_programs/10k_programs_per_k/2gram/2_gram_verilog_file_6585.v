// Seed: 913722148
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  id_6(
      .id_0(1), .id_1(id_4), .id_2(1 - id_1)
  ); module_0(
      id_3, id_1, id_3, id_2
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd13
) ();
  wire id_2 = id_2;
  task _id_3;
    begin
      repeat (id_2 ? id_3[id_3+:1] : (id_2)) begin
        id_1 <= 1'b0;
      end
    end
  endtask : id_4
  reg id_5 = id_1;
  module_0(
      id_2, id_4, id_4, id_2
  );
  assign id_5 = 1'h0 & id_4 & 1;
endmodule
