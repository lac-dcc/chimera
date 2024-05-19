// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


module chip_select
    #(parameter ADDR=0, WIDTH=8)
    (input wire wb_ck, 
    input wire [(WIDTH-1):0] addr, 
    input wire wb_cyc, 
    input wire wb_rst,
    output wire ack, 
    output wire cyc);

    wire match;
    assign match = addr == ADDR;
    assign cyc = match & wb_cyc;

    reg [1:0] state = 0;

    always @(posedge wb_ck) begin

        if (wb_rst || (!match) || !wb_cyc)
            state <= 0;
        else begin
            case (state)
                0 : state <= 1;
                1 : state <= 2;
                2 : state <= 3;
                3 : state <= 0;
            endcase
        end

    end

    assign ack = state == 1;

endmodule

