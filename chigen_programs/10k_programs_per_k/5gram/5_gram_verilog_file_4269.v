// Seed: 2119171081
module module_0;
  assign id_1 = 1;
  always_ff #1 begin
    case (1 !=? id_1)
      1: begin
        fork
          id_1 = 1;
          id_2(1);
          begin
            id_1 <= id_2;
            id_2 = id_1;
          end
        join
        if (id_2) id_2 <= ~id_2;
        else id_1 <= id_1;
      end
      1: begin
        disable id_3;
      end
    endcase
    if (id_1) deassign id_1;
  end
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    input supply0 id_2,
    output supply0 id_3
);
  assign id_1 = id_2 == id_2 ? 1'b0 : id_2;
  module_0();
endmodule
