// Seed: 3711872117
`define pp_1 0
`define pp_2 0
`define pp_3 0
`define pp_4 0
`define pp_5 0
`define pp_6 0
`resetall
`define pp_7 0
`timescale 1 ps / 1ps
module module_0 #(
    parameter id_1 = 32'd34,
    parameter id_3 = 32'd64
) (
    _id_1,
    id_2,
    _id_3
);
  input _id_3;
  input id_2;
  output _id_1;
  initial begin
    SystemTFIdentifier(id_2);
    if (id_1) begin
      if (id_3) begin
        id_3 <= 1;
        SystemTFIdentifier(1, 1 === 1);
        id_3 <= 1;
        id_1 <= 1;
        SystemTFIdentifier;
      end
      case (1)
        id_3: begin
          id_2 <= 1;
        end
        1'd0: id_2 = 1;
        id_2: id_2 = id_3;
        id_3: ;
      endcase
    end else begin
      if (1) begin
        id_3[1] <= 1;
      end else begin
        if (1 && id_1) id_1 <= id_2[id_1];
        else begin
          id_1 = {id_1, id_3};
          #1 id_1 = id_2;
          id_2 = 1;
          SystemTFIdentifier(1, id_1);
          id_1[1] <= id_3;
          id_1#(.id_1(id_2)) <= id_2;
        end
      end
    end
  end
  type_4(
      1, id_3, id_3
  );
  always @*
    if (id_1) begin
      id_3 <= id_1;
    end
  type_5(
      id_1, id_2, ~id_3
  );
  always @(*) begin
    SystemTFIdentifier(id_2);
    id_1 <= "";
    #(id_3);
    SystemTFIdentifier(1);
    id_3 = id_3[id_3];
    id_1[1] <= !id_3;
  end
endmodule
